{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  enrich,
}:

buildPythonPackage rec {
  pname = "subprocess-tee";
  version = "0.4.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pycontribs";
    repo = "subprocess-tee";
    tag = "v${version}";
    hash = "sha256-rfI4UZdENfSQ9EbQeldv6DDGIQe5yMjboGTCOwed1AU=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];
  pythonImportsCheck = [ "subprocess_tee" ];

  meta = {
    homepage = "https://github.com/pycontribs/subprocess-tee";
    description = "Subprocess.run drop-in replacement that supports a tee mode";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
