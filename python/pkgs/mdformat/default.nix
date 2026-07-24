{
  lib,
  buildPythonPackage,
  pythonOlder,
  fetchFromGitHub,
  setuptools,
  markdown-it-py,
}:

buildPythonPackage (finalAttrs: {
  pname = "mdformat";
  version = "1.0.0";
  pyproject = true;

  disabled = pythonOlder "3.12";

  src = fetchFromGitHub {
    owner = "executablebooks";
    repo = "mdformat";
    tag = finalAttrs.version;
    hash = "sha256-fo4xO4Y89qPAggEjwuf6dnTyu1JzhZVdJyUqGNpti7g=";
  };

  build-system = [ setuptools ];

  dependencies = [ markdown-it-py ];
  pythonImportsCheck = [ "mdformat" ];

  passthru = {
    withPlugins = throw "Use pkgs.mdformat.withPlugins, i.e. the top-level attribute.";
  };

  meta = {
    description = "CommonMark compliant Markdown formatter";
    homepage = "https://mdformat.rtfd.io/";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "mdformat";
  };
})
