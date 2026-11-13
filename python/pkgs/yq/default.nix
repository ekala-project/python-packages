{
  lib,
  argcomplete,
  buildPythonPackage,
  fetchPypi,
  pkgs,
  pyyaml,
  hatchling,
  hatch-vcs,
  tomlkit,
  xmltodict,
}:

let
  # The jq CLI, not python3Packages.jq (the Python bindings)
  jq-bin = pkgs.jq;
in
buildPythonPackage (finalAttrs: {
  pname = "yq";
  version = "4.4.5";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-4XshqSfQSuM/YacoQ1G2mwpTm/tzuFKgSpB7ebzRXeI=";
  };

  postPatch = ''
    substituteInPlace yq/__init__.py yq/parser.py \
      --replace-fail '["jq"' '["${lib.getExe jq-bin}"'
  '';

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    argcomplete
    pyyaml
    tomlkit
    xmltodict
  ];

  pythonImportsCheck = [ "yq" ];

  meta = {
    description = "Command-line YAML/XML/TOML processor - jq wrapper for YAML, XML, TOML documents";
    homepage = "https://github.com/kislyuk/yq";
    license = lib.licenses.asl20;
    mainProgram = "yq";
  };
})
