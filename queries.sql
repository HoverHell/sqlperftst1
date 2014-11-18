# .timer on

## Look up the abundant words
select count(word) cnt, word from filt group by word order by cnt desc limit 10;


## One-filter query (0.5s, still slow)
select node.loc, node.weight from node inner join filt on (node.id = filt.node_id) where (filt.word = 'aaa') order by node.weight desc limit 10;


## Two-filter query (2s, very slow)
select node.loc, node.weight from node inner join filt on (node.id = filt.node_id) inner join filt T5 on (node.id = T5.node_id) where (filt.word = 'aaa' and T5.word = 'aasvogel') order by node.weight desc limit 10;
