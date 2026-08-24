{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,
  flit-core,
}:

buildPythonPackage rec {
  pname = "testpath";
  version = "0.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-LxuX5kQsAmgevgG9hPUxAop8rqGvOCUAD1I0XDAoXg8=";
  };

  nativeBuildInputs = [ flit-core ];

  # exe are only required when testpath is used on windows
  # https://github.com/jupyter/testpath/blob/de8ca59539eb23b9781e55848b7d2646c8c61df9/testpath/commands.py#L128
  preBuild = lib.optionalString (!stdenv.hostPlatform.isWindows) ''
    rm testpath/cli-32.exe testpath/cli-64.exe
  '';

}
