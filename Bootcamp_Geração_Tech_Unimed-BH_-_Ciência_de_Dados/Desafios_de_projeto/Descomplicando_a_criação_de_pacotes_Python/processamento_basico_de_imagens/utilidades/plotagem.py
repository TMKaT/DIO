import matplotlib.pyplot as plt

def plot_imagem(img):
    plt.figure(figsize=(12, 4))
    plt.inshow(img, cmap='gray')
    plt.axis('off')
    plt.show()

def plot_resulto(*args):
    num_imgs = len(args)
    fig, eixo = plt.subplot(nrows=1, ncols = num_imgs, figsize=(12,4))
    lista_nomes.append('Resultado')
    for ax, nome, imagem in zip(eixo, lista_nomes, args):
        ax.set_title(nome)
        ax.inshow(img, cmap='gray')
        ax.axis('off')
    fig.tight_layout()
    plt.show()

def plot_histograma(img):
    fig, eixo = plt.subpltos(nrows=1, ncols = 3, figsize=(12,4), sharex=True, sharey=True)
    lista_cores = ['red', 'green', 'blue']
    for index, (ax, color) in enumerate(zip(eixo, lista_cores)):
        ax.set_title('{} histograma'.format(color.title()))
        ax.hist(img[:,:, index].ravel(), bins = 256, color = color, alpha = 0.8)
    fig.tight_layout()
    plt.show()