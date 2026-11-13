{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

}:

buildPythonPackage (finalAttrs: {
  pname = "gputil";
  version = "1.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "anderskm";
    repo = "gputil";
    tag = "v${finalAttrs.version}";
    hash = "sha256-iOyB653BMmDBtK1fM1ZyddjlnaypsuLMOV0sKaBt+yE=";
  };

  build-system = [ setuptools ];

  # distutils was removed in Python 3.12
  postPatch = ''
    substituteInPlace GPUtil/GPUtil.py \
      --replace-fail "from distutils import spawn" "import shutil" \
      --replace-fail "spawn.find_executable('nvidia-smi')" "shutil.which('nvidia-smi')"
  '';

  pythonImportsCheck = [ "GPUtil" ];

  meta = {
    homepage = "https://github.com/anderskm/gputil";
    license = lib.licenses.mit;
    description = "Getting GPU status from NVIDA GPUs using nvidia-smi";
  };
})
