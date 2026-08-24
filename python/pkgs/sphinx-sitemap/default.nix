{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, sphinx
, sphinx-last-updated-by-git
,
}:
let
  pname = "sphinx-sitemap";
  version = "2.9.0";
in
buildPythonPackage rec {
  inherit pname version;
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jdillard";
    repo = "sphinx-sitemap";
    tag = "v${version}";
    hash = "sha256-TiR6F9wMWOGYexSKDzbSPPq0oiIDrZwSiO3a9DajL+0=";
  };

  build-system = [ setuptools ];

  dependencies = [
    sphinx
    sphinx-last-updated-by-git
  ];

  meta = {
    description = "Sitemap generator for Sphinx";
    homepage = "https://github.com/jdillard/sphinx-sitemap";
    maintainers = [ ];
    license = lib.licenses.mit;
  };
}
