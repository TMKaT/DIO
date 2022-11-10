from setuptools import setup, find_packages

with open("README.md", "r") as f:
    page_description = f.read()

with open("requirements.txt") as f:
    requirements = f.read().splitlines()

setup(
    name="processamento_basico_de_imagens",
    version="0.0.1",
    author="Joadir D Junior",
    author_email="junior.jdj@hotmail.com",
    description="Pacote de processamento de imagem com Skimage",
    long_description=page_description,
    long_description_content_type="text/markdown",
    url="https://github.com/TMKaT/DIO/tree/main/Bootcamp%20Gera%C3%A7%C3%A3o%20Tech%20Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/Desafios%20de%20projeto/Descomplicando%20a%20cria%C3%A7%C3%A3o%20de%20pacotes%20de%20processamento%20de%20imagens%20em%20Python",
    packages=find_packages(),
    install_requires=requirements,
    python_requires='>=3.8',
)