{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  fsspec,
  pytest-asyncio,
  pytest-mock,
  reflink,
  setuptools-scm,
  shortuuid,
}:

buildPythonPackage rec {
  pname = "dvc-objects";
  version = "5.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "iterative";
    repo = "dvc-objects";
    tag = version;
    hash = "sha256-COrHD7RtmShdC7YWFc+S3xi/Xxt+Afrj3vaCLfE8t28=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace " --benchmark-skip" ""
  '';

  build-system = [ setuptools-scm ];

  dependencies = [ fsspec ];
  pythonImportsCheck = [ "dvc_objects" ];
  meta = {
    description = "Library for DVC objects";
    homepage = "https://github.com/iterative/dvc-objects";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
