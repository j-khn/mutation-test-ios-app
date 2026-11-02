#!/usr/bin/env python3
"""Generate the committed Xcode project from local packages; no third-party tools needed.
Source and test folders use Xcode synchronized groups, so file additions need no regeneration.
Run this after adding/removing a package in Modules/.
"""
from pathlib import Path
import hashlib
import json

ROOT = Path(__file__).resolve().parent.parent
PROJECT = ROOT / 'MutationTestIOSApp.xcodeproj'
PACKAGES = sorted(p.parent for p in (ROOT / 'Modules').glob('*/Package.swift'))
OBJECTS = {}

def uid(name):
    return hashlib.sha256(name.encode()).hexdigest()[:24].upper()

def quote(value):
    return json.dumps(str(value))

def array(values):
    return '(' + ', '.join(values) + (',' if values else '') + ')'

def add(key, isa, **fields):
    identifier = uid(key)
    OBJECTS[identifier] = (isa, fields)
    return identifier

def ref(key):
    return uid(key)

def sync(key, path, name=None):
    return add(key, 'PBXFileSystemSynchronizedRootGroup', explicitFileTypes='{}', explicitFolders='()', path=quote(path), name=quote(name or Path(path).name), sourceTree='SOURCE_ROOT')

app_group = sync('app-group', 'App')
app_tests = sync('app-tests-group', 'AppTests')
test_groups = [app_tests]
package_files = []
package_refs = []
app_products = []
test_products = []
app_frameworks = []
test_frameworks = []
for package in PACKAGES:
    module = package.name
    path = str(package.relative_to(ROOT))
    package_refs.append(add('package-' + module, 'XCLocalSwiftPackageReference', relativePath=quote(path)))
    package_files.append(add('package-file-' + module, 'PBXFileReference', lastKnownFileType='wrapper', path=quote(path), sourceTree='SOURCE_ROOT'))
    for target, products, frameworks in [('app', app_products, app_frameworks), ('tests', test_products, test_frameworks)]:
        product = add(target + '-product-' + module, 'XCSwiftPackageProductDependency', package=ref('package-' + module), productName=quote(module))
        products.append(product)
        frameworks.append(add(target + '-link-' + module, 'PBXBuildFile', productRef=product))
    test_root = package / 'Tests'
    if test_root.exists():
        test_groups.append(sync('tests-group-' + module, str(test_root.relative_to(ROOT)), module + 'Tests'))

config_files = []
for config in ['Debug', 'Release', 'Shared']:
    config_files.append(add('file-' + config, 'PBXFileReference', lastKnownFileType='text.xcconfig', path=quote(config + '.xcconfig'), sourceTree=quote('<group>')))
config_group = add('config-group', 'PBXGroup', path=quote('Configuration'), sourceTree=quote('<group>'), children=array(config_files))
readme = add('readme', 'PBXFileReference', lastKnownFileType='net.daringfireball.markdown', path=quote('README.md'), sourceTree=quote('<group>'))
plan_ref = add('plan-file', 'PBXFileReference', lastKnownFileType='text', path=quote('MutationTestIOSApp.xctestplan'), sourceTree=quote('<group>'))
module_group = add('modules-group', 'PBXGroup', name=quote('Modules'), sourceTree=quote('<group>'), children=array(package_files))
# Package tests remain visible under their packages. Their synchronized roots are
# referenced by the test target only, avoiding duplicate links in the navigator.
app_product = add('app-bundle', 'PBXFileReference', explicitFileType='wrapper.application', includeInIndex='0', path=quote('MutationTestIOSApp.app'), sourceTree='BUILT_PRODUCTS_DIR')
test_product = add('tests-bundle', 'PBXFileReference', explicitFileType='wrapper.cfbundle', includeInIndex='0', path=quote('MutationTestIOSAppTests.xctest'), sourceTree='BUILT_PRODUCTS_DIR')
products_group = add('products-group', 'PBXGroup', name=quote('Products'), sourceTree=quote('<group>'), children=array([app_product, test_product]))
main_group = add('main-group', 'PBXGroup', sourceTree=quote('<group>'), children=array([app_group, module_group, app_tests, config_group, plan_ref, readme, products_group]))

for target, frameworks in [('app', app_frameworks), ('tests', test_frameworks)]:
    for phase in ['Sources', 'Frameworks', 'Resources']:
        add(target + '-' + phase, 'PBX' + phase + 'BuildPhase', buildActionMask='2147483647', files=array(frameworks if phase == 'Frameworks' else []), runOnlyForDeploymentPostprocessing='0')

proxy = add('app-proxy', 'PBXContainerItemProxy', containerPortal=ref('project'), proxyType='1', remoteGlobalIDString=ref('app'), remoteInfo=quote('MutationTestIOSApp'))
dependency = add('app-dependency', 'PBXTargetDependency', target=ref('app'), targetProxy=proxy)
for target, name, product, groups, products in [
    ('app', 'MutationTestIOSApp', app_product, [app_group], app_products),
    ('tests', 'MutationTestIOSAppTests', test_product, test_groups, test_products),
]:
    add(target, 'PBXNativeTarget', buildConfigurationList=ref(target + '-configs'), buildPhases=array([ref(target + '-' + phase) for phase in ['Sources', 'Frameworks', 'Resources']]), buildRules='()', dependencies=array([dependency] if target == 'tests' else []), fileSystemSynchronizedGroups=array(groups), name=quote(name), packageProductDependencies=array(products), productName=quote(name), productReference=product, productType=quote('com.apple.product-type.application' if target == 'app' else 'com.apple.product-type.bundle.unit-test'))

for scope in ['project', 'app', 'tests']:
    configs = []
    for config in ['Debug', 'Release']:
        settings = {}
        if scope == 'app':
            settings = dict(PRODUCT_BUNDLE_IDENTIFIER='com.jamilkhan.MutationTestIOSApp', PRODUCT_NAME='$(TARGET_NAME)', PRODUCT_MODULE_NAME='MutationTestIOSApp', INFOPLIST_KEY_UILaunchScreen_Generation='YES', INFOPLIST_KEY_UIApplicationSceneManifest_Generation='YES', INFOPLIST_KEY_CFBundleDisplayName='Mutation Checkout', MARKETING_VERSION='1.0', CURRENT_PROJECT_VERSION='1')
        elif scope == 'tests':
            settings = dict(PRODUCT_BUNDLE_IDENTIFIER='com.jamilkhan.MutationTestIOSAppTests', PRODUCT_NAME='$(TARGET_NAME)', TEST_HOST='$(BUILT_PRODUCTS_DIR)/MutationTestIOSApp.app/$(BUNDLE_EXECUTABLE_FOLDER_PATH)/MutationTestIOSApp', BUNDLE_LOADER='$(TEST_HOST)')
        fields = dict(buildSettings='{ ' + ' '.join(f'{k} = {quote(v)};' for k, v in settings.items()) + ' }', name=quote(config))
        if scope == 'project':
            fields['baseConfigurationReference'] = ref('file-' + config)
        configs.append(add(scope + '-' + config, 'XCBuildConfiguration', **fields))
    add(scope + '-configs', 'XCConfigurationList', buildConfigurations=array(configs), defaultConfigurationIsVisible='0', defaultConfigurationName='Release')

attributes = '{ BuildIndependentTargetsInParallel = 1; LastUpgradeCheck = 2700; TargetAttributes = { ' + ref('app') + ' = { CreatedOnToolsVersion = 27.0; }; ' + ref('tests') + ' = { CreatedOnToolsVersion = 27.0; TestTargetID = ' + ref('app') + '; }; }; }'
add('project', 'PBXProject', attributes=attributes, buildConfigurationList=ref('project-configs'), developmentRegion='en', hasScannedForEncodings='0', knownRegions='(en, Base,)', mainGroup=main_group, minimizedProjectReferenceProxies='1', packageReferences=array(package_refs), preferredProjectObjectVersion='77', productRefGroup=products_group, projectDirPath=quote(''), projectRoot=quote(''), targets=array([ref('app'), ref('tests')]))
PROJECT.mkdir(exist_ok=True)
lines=['// !$*UTF8*$!', '{', '\tarchiveVersion = 1;', '\tclasses = {};', '\tobjectVersion = 77;', '\tobjects = {']
for identifier, (isa, fields) in sorted(OBJECTS.items()):
    lines.append(f'\t\t{identifier} = {{isa = {isa}; ' + ' '.join(f'{k} = {v};' for k,v in fields.items()) + ' };')
lines += ['\t};', f'\trootObject = {ref("project")};', '}']
(PROJECT/'project.pbxproj').write_text('\n'.join(lines)+'\n')

# One native test target compiles every package's own test sources and the app integration tests.
plan={
    'configurations':[{'id':'CE35FF50-10C0-4CE0-926F-645112AE2DA9','name':'Default','options':{}}],
    'defaultOptions':{'codeCoverage': True,'targetForVariableExpansion':{'containerPath':'container:MutationTestIOSApp.xcodeproj','identifier':ref('app'),'name':'MutationTestIOSApp'}},
    'testTargets':[{'parallelizable':False,'target':{'containerPath':'container:MutationTestIOSApp.xcodeproj','identifier':ref('tests'),'name':'MutationTestIOSAppTests'}}],
    'version':1,
}
(ROOT/'MutationTestIOSApp.xctestplan').write_text(json.dumps(plan,indent=2)+'\n')
def buildable(key, name, bundle):
    return f'<BuildableReference BuildableIdentifier="primary" BlueprintIdentifier="{ref(key)}" BuildableName="{bundle}" BlueprintName="{name}" ReferencedContainer="container:MutationTestIOSApp.xcodeproj"/>'
app_buildable=buildable('app','MutationTestIOSApp','MutationTestIOSApp.app')
test_buildable=buildable('tests','MutationTestIOSAppTests','MutationTestIOSAppTests.xctest')
scheme=f'''<?xml version="1.0" encoding="UTF-8"?>
<Scheme LastUpgradeVersion="2700" version="1.7">
  <BuildAction parallelizeBuildables="YES" buildImplicitDependencies="YES">
    <BuildActionEntries>
      <BuildActionEntry buildForTesting="YES" buildForRunning="YES" buildForProfiling="YES" buildForArchiving="YES" buildForAnalyzing="YES">{app_buildable}</BuildActionEntry>
      <BuildActionEntry buildForTesting="YES" buildForRunning="NO" buildForProfiling="NO" buildForArchiving="NO" buildForAnalyzing="NO">{test_buildable}</BuildActionEntry>
    </BuildActionEntries>
  </BuildAction>
  <TestAction buildConfiguration="Debug" selectedDebuggerIdentifier="Xcode.DebuggerFoundation.Debugger.LLDB" selectedLauncherIdentifier="Xcode.DebuggerFoundation.Launcher.LLDB" shouldUseLaunchSchemeArgsEnv="YES">
    <TestPlans><TestPlanReference reference="container:MutationTestIOSApp.xctestplan" default="YES"/></TestPlans>
  </TestAction>
  <LaunchAction buildConfiguration="Debug" selectedDebuggerIdentifier="Xcode.DebuggerFoundation.Debugger.LLDB" selectedLauncherIdentifier="Xcode.DebuggerFoundation.Launcher.LLDB" launchStyle="0" useCustomWorkingDirectory="NO" ignoresPersistentStateOnLaunch="NO" debugDocumentVersioning="YES" debugServiceExtension="internal" allowLocationSimulation="YES">
    <BuildableProductRunnable runnableDebuggingMode="0">{app_buildable}</BuildableProductRunnable>
  </LaunchAction>
  <ProfileAction buildConfiguration="Release" shouldUseLaunchSchemeArgsEnv="YES" savedToolIdentifier="" useCustomWorkingDirectory="NO" debugDocumentVersioning="YES"><BuildableProductRunnable runnableDebuggingMode="0">{app_buildable}</BuildableProductRunnable></ProfileAction>
  <AnalyzeAction buildConfiguration="Debug"/>
  <ArchiveAction buildConfiguration="Release" revealArchiveInOrganizer="YES"/>
</Scheme>
'''
scheme_path=PROJECT/'xcshareddata/xcschemes/MutationTestIOSApp.xcscheme'
scheme_path.parent.mkdir(parents=True,exist_ok=True)
scheme_path.write_text(scheme)
print(f'Generated {PROJECT.name}: {len(PACKAGES)} local packages, app, and full test target.')
