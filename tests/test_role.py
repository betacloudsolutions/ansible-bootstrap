def test_resolvconf_is_installed(Package):
    package = Package("resolvconf")
    assert package.is_installed


def test_resolvconf_serivce_running_and_enabled(Service):
    service = Service("resolvconf.service")
    assert service.is_running
    assert service.is_enabled
