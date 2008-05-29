use inc::Module::Install;
include 'Module::AutoInstall';

name 'File-Find-Upwards';
all_from 'lib/File/Find/Upwards.pm';
perl_version '5.006';

requires 'File::Spec::Functions';
requires 'Attribute::Memoize';

build_requires 'Test::More' => '0.70';

process_templates(
    first_year => 2008,
    rest_from  => "$ENV{HOME}/.mitlib/standard_pod",
    start_tag  => '{%',
    end_tag    => '%}',
);

use_standard_tests(without => 'pod_coverage');
auto_install;
auto_include;
WriteAll;
