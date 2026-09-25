{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  jinja2,
  markdown,
  markupsafe,
  mkdocs,
  mkdocs-autorefs,
  pdm-backend,
  pymdown-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "mkdocstrings";
  version = "1.0.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mkdocstrings";
    repo = "mkdocstrings";
    tag = finalAttrs.version;
    hash = "sha256-yHTxD7Su/hlW1Hxac20vr8OpLuEEO8GRu32OhZQWqYo=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'dynamic = ["version"]' 'version = "${finalAttrs.version}"'
  '';

  build-system = [ pdm-backend ];

  dependencies = [
    jinja2
    markdown
    markupsafe
    mkdocs
    mkdocs-autorefs
    pymdown-extensions
  ];
  pythonImportsCheck = [ "mkdocstrings" ];
  meta = {
    description = "Automatic documentation from sources for MkDocs";
    homepage = "https://github.com/mkdocstrings/mkdocstrings";
    license = lib.licenses.isc;
  };
})
