{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "result";
  version = "0.17.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "rustedpy";
    repo = "result";
    rev = "v${version}";
    hash = "sha256-o+7qKxGQCeMUnsmEReggvf+XwQWFHRCYArYk3DxCa50=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "result" ];

  meta = {
    description = "Rust-like result type for Python";
    homepage = "https://github.com/rustedpy/result";
    license = lib.licenses.mit;
  };
}
