{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  fetchpatch,
  # build-system
  setuptools,
  mock,
  pytest-asyncio,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "promise";
  version = "2.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "syrusakbary";
    repo = "promise";
    tag = "v${finalAttrs.version}";
    hash = "sha256-5s6GMANSO4UpLOP/HAQxuNFSBSjPgvJCB9R1dOoKuJ4=";
  };

  build-system = [ setuptools ];

  patches = [
    # Convert @asyncio.coroutine to async def, https://github.com/syrusakbary/promise/pull/99
    (fetchpatch {
      name = "use-async-def.patch";
      url = "https://github.com/syrusakbary/promise/commit/3cde549d30b38dcff81b308e18c7f61783003791.patch";
      hash = "sha256-XCbTo6RCv75nNrpbK3TFdV0h7tBJ0QK+WOAR8S8w9as=";
    })
  ];

  postPatch = ''
    substituteInPlace tests/test_extra.py \
      --replace "assert_exc.traceback[-1].path.strpath" "str(assert_exc.traceback[-1].path)"
  '';

  dependencies = [ six ];
  pythonImportsCheck = [ "promise" ];

  meta = {
    description = "Ultra-performant Promise implementation in Python";
    homepage = "https://github.com/syrusakbary/promise";
    license = lib.licenses.mit;
  };
})
