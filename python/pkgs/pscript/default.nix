{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "pscript";
  version = "0.8.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "flexxui";
    repo = "pscript";
    tag = "v${finalAttrs.version}";
    hash = "sha256-eb2hODFiVAsYmx3XnPToVQFzgug/IkfE+MiTUeSWY7M=";
  };

  build-system = [ flit-core ];

  meta = {
    description = "Python to JavaScript compiler";
    homepage = "https://pscript.readthedocs.io";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
})
