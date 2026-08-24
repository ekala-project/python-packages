{ lib
, buildPythonPackage
, fetchFromGitHub
, impacket
, netaddr
, poetry-core
, pypykatz
, rich
,
}:

buildPythonPackage (finalAttrs: {
  pname = "lsassy";
  version = "3.1.16";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Hackndo";
    repo = "lsassy";
    tag = "v${finalAttrs.version}";
    hash = "sha256-lPbZnoR6qWfVBSRAbTJsKpjBieidNsYgAXI3CXHEt1w=";
  };

  pythonRelaxDeps = [
    "impacket"
  ];

  build-system = [ poetry-core ];

  dependencies = [
    impacket
    netaddr
    pypykatz
    rich
  ];

  pythonImportsCheck = [ "lsassy" ];

  meta = {
    description = "Python module to extract data from Local Security Authority Subsystem Service (LSASS)";
    homepage = "https://github.com/Hackndo/lsassy";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "lsassy";
  };
})
