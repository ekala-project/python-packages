{
  buildPythonPackage,
  fetchFromGitHub,
  lib,
  setuptools,
  zstd,
}:

buildPythonPackage rec {
  pname = "backports-zstd";
  version = "1.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "rogdham";
    repo = "backports.zstd";
    tag = "v${version}";
    fetchSubmodules = true;
    postFetch = ''
      rm -r "$out/src/c/zstd"
    '';
    hash = "sha256-AF2Id4U2++RMCFICxz0E3DrgEVgGNsph4sIZ9YC87fE=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace-fail 'ROOT_PATH / "src" / "c" / "zstd"' 'Path("${zstd.src}")'
  '';

  build-system = [ setuptools ];

  pypaBuildFlags = [ "--config-setting=--build-option=--system-zstd" ];

  buildInputs = [ zstd ];

  pythonImportsCheck = [ "backports.zstd" ];

  meta = {
    description = "Backport of compression.zstd";
    homepage = "https://github.com/rogdham/backports.zstd";
    license = lib.licenses.psfl;
  };
}
