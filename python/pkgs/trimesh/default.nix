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
  version = "5.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mikedh";
    repo = "trimesh";
    tag = finalAttrs.version;
    hash = "sha256-HK0CqSSO9QLrVv8hgt7sAdTtuzGU68tmflB+O6mQaCE=";
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
  };
})
