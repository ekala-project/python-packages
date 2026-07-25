{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  markdown,
  mkdocs-material,
  pdm-backend,
  markupsafe,
}:

buildPythonPackage rec {
  pname = "mkdocs-autorefs";
  version = "1.4.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mkdocstrings";
    repo = "autorefs";
    tag = version;
    hash = "sha256-kEDnCAqn9musqbY4efUrAHcKc/LAhH1zkLAI9fP/7eg=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace 'dynamic = ["version"]' 'version = "${version}"'
  '';

  build-system = [ pdm-backend ];

  dependencies = [
    markdown
    markupsafe
    mkdocs-material
  ];
  pythonImportsCheck = [ "mkdocs_autorefs" ];

  meta = {
    description = "Automatically link across pages in MkDocs";
    homepage = "https://github.com/mkdocstrings/autorefs/";
    license = lib.licenses.isc;
    maintainers = [ ];
  };
}
