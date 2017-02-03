# This file is subject to the terms and conditions defined in file 'LICENSE',
# which is part of this repository.


def test_resolvconf_is_installed(Package, SystemInfo):
    if SystemInfo.distribution == 'ubuntu':
        package = Package("resolvconf")
        assert package.is_installed

    elif SystemInfo.distribution == 'centos':
        assert True


def test_resolvconf_serivce_running_and_enabled(Service, SystemInfo):
    if SystemInfo.distribution == 'ubuntu':
        service = Service("resolvconf.service")
        assert service.is_running
        assert service.is_enabled

    elif SystemInfo.distribution == 'centos':
        assert True
