{
  lib,
  buildPythonPackage,
  fetchPypi,
  mock,
  msgpack,
  pandas,
  python-dateutil,
  pytz,
  requests,
  requests-mock,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "influxdb";
  version = "5.3.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-WMZH9gQ3Et2G6a7hLrTM+7tUFUZ7yZEKSKqMdMEQiXA=";
  };

  patches = [
    # https://github.com/influxdata/influxdb-python/pull/835
    ./remove-nose.patch
  ];

  postPatch = ''
    for f in influxdb/tests/dataframe_client_test.py influxdb/tests/influxdb08/dataframe_client_test.py; do
      substituteInPlace "$f" \
        --replace-fail "pandas.util.testing" "pandas.testing"
    done

    for f in influxdb/tests/influxdb08/client_test.py influxdb/tests/client_test.py; do
      substituteInPlace "$f" \
        --replace-fail "assertRaisesRegexp" "assertRaisesRegex"
    done
  '';

  build-system = [ setuptools ];

  dependencies = [
    msgpack
    python-dateutil
    pytz
    requests
    six
  ];
  pythonImportsCheck = [ "influxdb" ];

  meta = {
    description = "Python client for InfluxDB";
    homepage = "https://github.com/influxdb/influxdb-python";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
