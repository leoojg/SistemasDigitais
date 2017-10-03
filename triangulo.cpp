#include<stdio.h>
#include<stdlib.h>
 
struct ponto { int x, y; ponto() {}
  ponto(int _x, int _y) : x(_x), y(_y) {} };
 
struct vetor { int x, y; vetor() {}
  vetor(int _x, int _y) : x(_x), y(_y) {}
  vetor(ponto a, ponto b) : x(b.x - a.x), y(b.y - a.y) {} };
 
ponto P[3];
 
int prodesc(vetor u, vetor v) { return u.x * v.x + u.y * v.y; }
int prodvet(vetor u, vetor v) { return u.x * v.y - u.y * v.x; }
 
int cmp(const void *a, const void *b) {
  ponto p1 = *(ponto *)a, p2 = *(ponto *)b;
  vetor u = vetor(P[0], p1), v = vetor(P[0], p2);
  int ret = prodvet(u, v);
  if (ret == 0) return prodesc(u, u) - prodesc(v, v);
  return -ret;
}
 
int main(void) {
  ponto est, aux;
  int i, j, k, mini, flag = 1;
  for (i = 0; i < 3; i++) scanf("%d %d", &P[i].x, &P[i].y); 
  for (mini = 0, i = 1; i < 3; i++)
    if (P[i].y < P[mini].y ||
        (P[i].y == P[mini].y && P[i].x < P[mini].x)) mini = i;
  aux = P[0]; P[0] = P[mini]; P[mini] = aux;
  qsort(P + 1, 2, sizeof(ponto), &cmp);
  if (prodvet(vetor(P[0], P[1]), vetor(P[0], P[2])) == 0) {
    aux = P[2]; P[2] = P[3]; P[3] = aux;
  }
  for(i = 40; i >= 0; i--){
    for(j = 0; j < 40; j++){
      est.x = j; est.y = i;
      for (k = 0, flag = 1; k < 3 && flag; k++)
	flag &=
	  (prodvet(vetor(P[k], P[(k + 1) % 3]), vetor(P[k], est)) >= 0);
      if(flag) printf(".");
      else printf(" ");
    }
    printf("\n");
  }
  return 0;
}
