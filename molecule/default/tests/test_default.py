def test_cron_service_is_running_and_enabled(host):
    s = host.service("cron")
    assert s.is_running
    assert s.is_enabled
