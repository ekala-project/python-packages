{
  buildPythonPackage,
  fetchFromGitHub,
  lib,
  libffi,
  pkg-config,
  pycparser,
  setuptools,
  stdenv,
}:

buildPythonPackage rec {
  pname = "cffi";
  version = "2.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-cffi";
    repo = "cffi";
    tag = "v${version}";
    hash = "sha256-17OgcPo1pYwsPV/2iHe7iXVusCp5zLTFGcHYUfX1g48=";
  };

  nativeBuildInputs = [ pkg-config ];

  build-system = [ setuptools ];

  buildInputs = [ libffi ];

  # Some dependent packages expect to have pycparser available when using cffi.
  dependencies = [ pycparser ];

  doCheck = !(stdenv.hostPlatform.isMusl || stdenv.hostPlatform.useLLVM or false);
  meta = {
    description = "Foreign Function Interface for Python calling C code";
    downloadPage = "https://github.com/python-cffi/cffi";
    homepage = "https://cffi.readthedocs.org/";
    license = lib.licenses.mit0;
    teams = [ lib.teams.python ];
  };
}
