{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  hatchling,
  hatch-fancy-pypi-readme,
  # dependencies
  lxml,
}:

buildPythonPackage (finalAttrs: {
  pname = "yaxmldiff";
  version = "0.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "latk";
    repo = "yaxmldiff.py";
    tag = "v${finalAttrs.version}";
    hash = "sha256-bLqb/a0z7jajo2XUdvAJckLKyUC6KDByvd3yKVlps5c=";
  };

  postPatch = ''
    sed -i '/cappa/d' pyproject.toml
  '';

  build-system = [
    hatchling
    hatch-fancy-pypi-readme
  ];

  dependencies = [ lxml ];

  meta = {
    description = "Yet Another XML Differ";
    homepage = "https://github.com/latk/yaxmldiff.py";
    license = lib.licenses.asl20;
  };
})
