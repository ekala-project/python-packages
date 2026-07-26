{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  numpy,

  # optional deps
  colorlog,
  charset-normalizer,
  jsonschema,
  lxml,
  networkx,
  svg-path,
  pycollada,
  shapely,
  xxhash,
  rtree,
  httpx,
  scipy,
  pillow,
}:

buildPythonPackage (finalAttrs: {
  pname = "trimesh";
  version = "4.12.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mikedh";
    repo = "trimesh";
    tag = finalAttrs.version;
    hash = "sha256-Zef/BCheJWJNkK+ligeAMmuI3EX4uGfcNNbEJ9BNngY=";
  };

  build-system = [ setuptools ];

  dependencies = [ numpy ];

  optional-dependencies = {
    easy = [
      colorlog
      charset-normalizer
      lxml
      jsonschema
      networkx
      svg-path
      pycollada
      shapely
      xxhash
      rtree
      httpx
      scipy
      pillow
    ];
  };

  pythonImportsCheck = [
    "trimesh"
    "trimesh.ray"
    "trimesh.path"
    "trimesh.scene"
  ];

  meta = {
    description = "Python library for loading and using triangular meshes";
    homepage = "https://trimesh.org/";
    license = lib.licenses.mit;
    mainProgram = "trimesh";
    maintainers = [ ];
  };
})
