{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pyspellchecker";
  version = "0.9.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "barrust";
    repo = "pyspellchecker";
    tag = "v${version}";
    hash = "sha256-Ui1IPqvVqf7scMg+B1KmI5jWrHSsuaW6sCoWeiF2oMI=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "spellchecker" ];

  meta = {
    description = "Pure python spell checking";
    homepage = "https://github.com/barrust/pyspellchecker";
    license = lib.licenses.mit;
  };
}
