use inc::Module::Install;
include 'Module::AutoInstall';

name 'File-Find-Upwards';
all_from 'lib/File/Find/Upwards.pm';
perl_version '5.006';

requires 'File::Spec::Functions';
requires 'Attribute::Memoize';

recommends 'Test::Pod';
recommends 'Test::Pod::Coverage';

test_requires 'Test::More' => '0.70';
test_requires 'Test::Compile';

auto_install;
auto_include;
WriteAll;
