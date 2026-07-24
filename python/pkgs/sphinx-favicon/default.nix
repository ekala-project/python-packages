{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  sphinx,
}:

buildPythonPackage rec {
  pname = "sphinx-favicon";
  version = "1.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tcmetzger";
    repo = "sphinx-favicon";
    tag = "v${version}";
    hash = "sha256-8zKG145BttlE8HYJ0H8O762TYC9KeIO8L9UfgNDs+i8=";
  };

  build-system = [ setuptools ];

  dependencies = [ sphinx ];

  pythonImportsCheck = [ "sphinx_favicon" ];

  meta = {
    description = "Sphinx extension to add custom favicons";
    homepage = "https://github.com/tcmetzger/sphinx-favicon";
    changelog = "https://github.com/tcmetzger/sphinx-favicon/blob/v${version}/CHANGELOG";
    license = lib.licenses.mit;
  };
}
