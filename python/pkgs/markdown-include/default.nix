{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  markdown,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "markdown-include";
  version = "0.8.1";
  pyproject = true;

  # only wheel on pypi
  src = fetchFromGitHub {
    owner = "cmacmackin";
    repo = "markdown-include";
    tag = "v${finalAttrs.version}";
    hash = "sha256-1MEk0U00a5cpVhqnDZkwBIk4NYgsRXTVsI/ANNQ/OH0=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ setuptools-scm ];

  dependencies = [ markdown ];

  pythonImportsCheck = [ "markdown_include" ];

  meta = {
    description = "Extension to Python-Markdown which provides an include function";
    homepage = "https://github.com/cmacmackin/markdown-include";
    license = lib.licenses.gpl3Plus;
  };
})
