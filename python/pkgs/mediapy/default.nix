{
  lib,
  bash,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  ipython,
  matplotlib,
  numpy,
  pillow,
}:

buildPythonPackage (finalAttrs: {
  pname = "mediapy";
  version = "1.2.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "google";
    repo = "mediapy";
    tag = "v${finalAttrs.version}";
    hash = "sha256-+p88Zc7YuN0P4i1AzTQfQqCFo6Uc6hpDKgoDpdJxMaI=";
  };

  postPatch = ''
    substituteInPlace mediapy_test.py \
      --replace-fail "/bin/bash" "${lib.getExe bash}"
  '';

  build-system = [ flit-core ];

  dependencies = [
    ipython
    matplotlib
    numpy
    pillow
  ];
  pythonImportsCheck = [ "mediapy" ];

  meta = {
    description = "Read/write/show images and videos in an IPython notebook";
    homepage = "https://github.com/google/mediapy";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
