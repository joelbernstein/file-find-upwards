use inc::Module::Install;
include 'Module::AutoInstall';

name 'File-Find-Upwards';
all_from 'lib/File/Find/Upwards.pm';
perl_version '5.006';

requires 'Path::Class';
requires 'Attribute::Memoize';

test_requires 'Test::More' => '0.70';
extra_tests;

auto_install;
auto_include;
WriteAll;
