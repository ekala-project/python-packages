{
  lib,
  beautifulsoup4,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "markdownify";
  version = "1.2.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "matthewwithanm";
    repo = "python-markdownify";
    tag = finalAttrs.version;
    hash = "sha256-r6nah7QavrMjIHd5hByhy90OoTDb2iIhFZ+YV0h61fU=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    beautifulsoup4
    six
  ];

  pythonImportsCheck = [ "markdownify" ];

  meta = {
    description = "HTML to Markdown converter";
    homepage = "https://github.com/matthewwithanm/python-markdownify";
    license = lib.licenses.mit;
    mainProgram = "markdownify";
  };
})
