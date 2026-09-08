{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytestCheckHook,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "metar";
  version = "2.0.1";
  pyproject = true;

  env.SETUPTOOLS_SCM_PRETEND_VERSION = version;

  src = fetchFromGitHub {
    owner = "python-metar";
    repo = "python-metar";
    tag = "v${version}";
    hash = "sha256-MRcGUFcp3oL9rrGl3xGGttle5oXkJqxxZvkWVe0uWv8=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "metar" ];

  meta = {
    description = "Python parser for coded METAR weather reports";
    homepage = "https://github.com/python-metar/python-metar";
    changelog = "https://github.com/python-metar/python-metar/blob/v${version}/CHANGELOG.md";
    license = with lib.licenses; [ bsd1 ];
  };
}
