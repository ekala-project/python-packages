{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  sphinx,
  pyenchant,
  hatchling,
  hatch-vcs,
  wheel,
}:

buildPythonPackage rec {
  pname = "sphinxcontrib-spelling";
  version = "8.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sphinx-contrib";
    repo = "spelling";
    tag = version;
    hash = "sha256-f9n3hp+d3UvfVt2KmhxYm80XsEnIx3EVkdrQJxWDxks=";
  };

  nativeBuildInputs = [
    hatchling
    hatch-vcs
    wheel
  ];

  propagatedBuildInputs = [
    sphinx
    pyenchant
  ];

  # No tests included
  pythonImportsCheck = [ "sphinxcontrib.spelling" ];

  pythonNamespaces = [ "sphinxcontrib" ];

  meta = {
    description = "Sphinx spelling extension";
    homepage = "https://github.com/sphinx-contrib/spelling";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}
