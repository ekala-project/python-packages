{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  mkdocs,
}:

buildPythonPackage (finalAttrs: {
  pname = "mkdocs-custom-tags-attributes";
  version = "0.3.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Mara-Li";
    repo = "mkdocs-custom-tags-attributes";
    tag = "v${finalAttrs.version}";
    hash = "sha256-AtjUMk7v3+QI76nnPslqW/8LO11ld0YLSacHI6eaurs=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    mkdocs
  ];

  pythonImportsCheck = [
    "custom_attributes"
  ];

  doCheck = false;

  meta = {
    description = "A mkdocs plugin to create custom attributes using hashtags";
    homepage = "https://github.com/Mara-Li/mkdocs-custom-tags-attributes";
    license = lib.licenses.gpl3Only;
    maintainers = [ ];
    mainProgram = "mkdocs-custom-tags-attributes";
  };
})
