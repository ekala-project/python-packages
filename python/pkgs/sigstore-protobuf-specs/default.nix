{
  lib,
  flit-core,
  fetchPypi,
  buildPythonPackage,
  betterproto,
  pydantic,
}:

buildPythonPackage rec {
  pname = "sigstore-protobuf-specs";
  version = "0.5.2";
  pyproject = true;

  src = fetchPypi {
    pname = "sigstore_protobuf_specs";
    inherit version;
    hash = "sha256-oJYdfjYe38YdCp+ylVcG0T2p3rkoWCpZ2q40sIR3XJM=";
  };

  nativeBuildInputs = [ flit-core ];

  propagatedBuildInputs = [
    betterproto
    pydantic
  ];

  # Module has no tests
  doCheck = false;

  pythonImportsCheck = [ "sigstore_protobuf_specs" ];

  passthru.skipBulkUpdate = true;

  meta = {
    description = "Library for serializing and deserializing Sigstore messages";
    homepage = "https://github.com/sigstore/protobuf-specs/tree/main/gen/pb-python";
    license = lib.licenses.asl20;
  };
}
