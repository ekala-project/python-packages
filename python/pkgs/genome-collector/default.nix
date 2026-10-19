{
  lib,
  buildPythonPackage,
  appdirs,
  biopython,
  fetchPypi,
  # build-system
  setuptools,
  proglog,
}:

buildPythonPackage rec {
  pname = "genome_collector";
  version = "0.1.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "0023ihrz0waxbhq28xh1ymvk51ih882y9psg4glm6s9d1zmqvdph";
  };

  build-system = [ setuptools ];

  dependencies = [
    appdirs
    biopython
    proglog
  ];

  # Project hasn't released the tests yet
  pythonImportsCheck = [ "genome_collector" ];

  meta = {
    description = "Genomes and build BLAST/Bowtie indexes in Python";
    homepage = "https://github.com/Edinburgh-Genome-Foundry/genome_collector";
    license = lib.licenses.mit;
  };
}
