{
  argparse-dataclass,
  buildPythonPackage,
  dpath,
  fetchFromGitHub,
  pyyaml,
  uv-build,
}:

buildPythonPackage (finalAttrs: {
  pname = "yte";
  version = "1.9.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "koesterlab";
    repo = "yte";
    tag = "v${finalAttrs.version}";
    hash = "sha256-TpY13HYBZ4qL2W6sPdoM+bpHcEOi0rwubCbFa4zm2I0=";
  };

  build-system = [ uv-build ];

  dependencies = [
    dpath
    argparse-dataclass
    pyyaml
  ];

  pythonImportsCheck = [ "yte" ];

})
