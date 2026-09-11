{
  buildPythonPackage,
  fetchFromGitHub,
  lib,
  pkgs,
  setuptools,
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
      --replace-fail \
        'f.write((ROOT_PATH / "src" / "c" / "zstd" / "LICENSE").read_text())' \
        'f.write("Using system zstd\n")'
  '';

  build-system = [ setuptools ];

  pypaBuildFlags = [ "--config-setting=--build-option=--system-zstd" ];

  buildInputs = [ pkgs.zstd ];

  pythonImportsCheck = [ "backports.zstd" ];

  meta = {
    description = "Backport of compression.zstd";
    homepage = "https://github.com/rogdham/backports.zstd";
    license = lib.licenses.psfl;
  };
}
