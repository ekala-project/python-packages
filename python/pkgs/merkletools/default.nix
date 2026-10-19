{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "merkletools";
  version = "1.0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Tierion";
    repo = "pymerkletools";
    tag = finalAttrs.version;
    hash = "sha256-pd7Wxi7Sk95RcrFOTOtl725nIXidva3ftdKSGxHYPTA=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    # pysha3 is deprecated and not needed for Python > 3.6
    substituteInPlace setup.py \
      --replace "install_requires=install_requires" "install_requires=[],"
  '';

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "merkletools" ];

  meta = {
    description = "Python tools for creating Merkle trees, generating Merkle proofs, and verification of Merkle proofs";
    homepage = "https://github.com/Tierion/pymerkletools";
    license = lib.licenses.mit;
  };
})
