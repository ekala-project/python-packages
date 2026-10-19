{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  inform,
  sly,
}:

buildPythonPackage (finalAttrs: {
  pname = "quantiphy-eval";
  version = "0.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "KenKundert";
    repo = "quantiphy_eval";
    tag = "v${finalAttrs.version}";
    hash = "sha256-7VHcuINhe17lRNkHUnZkVOEtD6mVWk5gu0NbrLZwprg=";
  };

  nativeBuildInputs = [ flit-core ];

  dependencies = [
    inform
    sly
  ];

  # this has a circular dependency on quantiphy
  preBuild = ''
    sed -i '/quantiphy>/d' ./pyproject.toml
  '';

  # Also affected by the circular dependency on quantiphy
  # pythonImportsCheck = [
  #   "quantiphy_eval"
  # ];

  meta = {
    description = "QuantiPhy support for evals in-line";
    homepage = "https://github.com/KenKundert/quantiphy_eval/";
    license = lib.licenses.mit;
  };
})
