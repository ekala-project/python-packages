{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  pytest,
  sphinx,
  defusedxml,
}:

buildPythonPackage rec {
  pname = "sphinx-pytest";
  version = "0.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "chrisjsewell";
    repo = "sphinx-pytest";
    tag = "v${version}";
    hash = "sha256-z71IrUr3e2oAPeZMjUBwMwy2SkoAA3oxtK4+iR9vLEc=";
  };

  nativeBuildInputs = [ flit-core ];

  propagatedBuildInputs = [ sphinx ];

  buildInputs = [ pytest ];

  pythonImportsCheck = [ "sphinx_pytest" ];
  meta = {
    description = "Helpful pytest fixtures for Sphinx extensions";
    homepage = "https://github.com/chrisjsewell/sphinx-pytest";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
