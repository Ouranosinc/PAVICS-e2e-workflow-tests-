def pytest_collectstart(collector):
    collector.skip_compare += 'text/html', 'application/javascript',
