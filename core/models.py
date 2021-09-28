from django.db import models

# Create your models here.



class Atividade(models.Model):
    nome = models.CharField(max_length=100)
    is_finished = models.BooleanField(default=False)

    def __str__(self):
        return self.nome        


class Tecnico(models.Model):
    nome = models.CharField(max_length=100)
    atividade = models.ForeignKey(Atividade, on_delete=models.CASCADE)    

    class Meta:
        verbose_name = 'Favorite'
        verbose_name_plural = 'Favorites'

    def __repr__(self):
        return f"BookID ={self.book.id}user={self.user.username}|ISFavorite={self.isFavorit}"
    
    def __str__(self):
        return self.nome
