{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  jsonschema,
  python,
}:

buildPythonPackage rec {
  pname = "robotframework";
  version = "7.4.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "robotframework";
    repo = "robotframework";
    tag = "v${version}";
    hash = "sha256-SSjVrbe3uBqCMEUYjrk2lxHpxzdU6QK2xvEFszhT6lc=";
  };

  build-system = [ setuptools ];
  checkPhase = ''
    ${python.interpreter} utest/run.py
  '';

  meta = {
    description = "Generic test automation framework";
    homepage = "https://robotframework.org/";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
