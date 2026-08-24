{
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  lib,
  versionCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-ly";
  version = "0.9.10";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "frescobaldi";
    repo = "python-ly";
    tag = "v${finalAttrs.version}";
    hash = "sha256-diLg1rU+SmCutW1WJQtMJvpipU+k8GluvAqFfcv1GS4=";
  };

  pythonImportsCheck = [ "ly" ];

  build-system = [ hatchling ];

  nativeInstallCheckInputs = [ versionCheckHook ];

  meta = {
    description = "Tool and library for manipulating LilyPond files";
    homepage = "https://pypi.org/project/python-ly";
    license = lib.licenses.gpl3Plus;
    maintainers = [ ];
    mainProgram = "ly";
  };
})
