{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  numpy,
  pytestCheckHook,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "emcee";
  version = "3.1.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dfm";
    repo = "emcee";
    tag = "v${finalAttrs.version}";
    hash = "sha256-JVZK3kvDwWENho0OxZ9OxATcm3XpGmX+e7alPclRsHY=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ setuptools-scm ];

  dependencies = [ numpy ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "emcee" ];

  meta = {
    description = "Kick ass affine-invariant ensemble MCMC sampling";
    homepage = "https://emcee.readthedocs.io/";
    license = lib.licenses.mit;
  };
})
