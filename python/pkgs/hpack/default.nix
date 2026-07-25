{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "hpack";
  version = "4.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-hyper";
    repo = "hpack";
    rev = "v${version}";
    hash = "sha256-gZe/ABRLXoBAeH/mp/yIgDj56jalyiYgs4EP2qK17Ig=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "hpack" ];

  meta = {
    description = "Pure-Python HPACK header compression";
    homepage = "https://github.com/python-hyper/hpack";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
