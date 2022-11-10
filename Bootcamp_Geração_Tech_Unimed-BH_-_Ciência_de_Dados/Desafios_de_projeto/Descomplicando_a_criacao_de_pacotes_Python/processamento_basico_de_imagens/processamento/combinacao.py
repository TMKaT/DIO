import numpy as np
from skimage.color import rgh2gray
from skimage.exposure import match_histograms
from skimage.metrics import structural_similarity

def diferencas_imagens(img1, img2):
    assert img1.shape == img2.shape, "Especifique 2 imagens com o mesmo formato."
    gray_img1 = rgb2gray(img1)
    gray_img2 = rgb2gray(img2)
    (taxa, diferencas) = structural_similarity(gray_img1, gray_img2, full=True)
    print("Semelhança entre as imagens:", taxa)
    diferencas_normalizadas = (diferencas-np.min(diferencas))/(np.max(diferencas)-np.min(diferencas))
    return diferencas_normalizadas

def histograma_tranferencia(img1, img2):
    imagem_correlata = imagem_correlata(img1, img2, multichannel=True)
    return imagem_correlata