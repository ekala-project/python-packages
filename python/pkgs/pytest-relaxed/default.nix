{
  lib,
  buildPythonPackage,
  decorator,
  fetchPypi,
  invoke,
  pytest,
}:

buildPythonPackage rec {
  pname = "pytest-relaxed";
  version = "2.0.2";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-lW6gKOww27+2gN2Oe0p/uPgKI5WV6Ius4Bi/LA1xgkg=";
  };

  patches = [
    # https://github.com/bitprophet/pytest-relaxed/issues/28
    # https://github.com/bitprophet/pytest-relaxed/pull/29
    ./fix-oldstyle-hookimpl-setup.patch
  ];

  buildInputs = [ pytest ];

  propagatedBuildInputs = [ decorator ];
  pythonImportsCheck = [ "pytest_relaxed" ];

  meta = {
    homepage = "https://pytest-relaxed.readthedocs.io/";
    description = "Relaxed test discovery/organization for pytest";
    license = lib.licenses.bsd0;
    maintainers = [ ];
  };
}
