(window.__LOADABLE_LOADED_CHUNKS__=window.__LOADABLE_LOADED_CHUNKS__||[]).push([[1],{36:function(e,t,a){"use strict";a.r(t);var r=a(2),n=a(1),l=a(4),s=a(7),i=a(23),c=a(0);var o=Object(l.connect)(e=>{var{state:t,item:a}=e,r=t.source.author[a.author],n=new Date(a.date);return Object(c.jsx)("article",null,Object(c.jsx)(s.a,{link:a.link},Object(c.jsx)(b,{dangerouslySetInnerHTML:{__html:a.title.rendered}})),Object(c.jsx)("div",null,r&&Object(c.jsx)(u,{link:r.link},Object(c.jsx)(j,null,"By ",Object(c.jsx)("b",null,r.name))),Object(c.jsx)(x,null," ","on ",Object(c.jsx)("b",null,n.toDateString()))),t.theme.featured.showOnList&&Object(c.jsx)(i.a,{id:a.featured_media}),a.excerpt&&Object(c.jsx)(O,{dangerouslySetInnerHTML:{__html:a.excerpt.rendered}}))}),b=Object(r.a)("h1",{target:"e1p5zhim0",label:"Title"})({name:"m6r8cl",styles:"font-size:2rem;color:rgba(12,17,43);margin:0;padding-top:24px;padding-bottom:8px;box-sizing:border-box;"}),j=Object(r.a)("span",{target:"e1p5zhim1",label:"AuthorName"})({name:"s9xu3a",styles:"color:rgba(12,17,43,0.9);font-size:0.9em;"}),u=Object(r.a)(s.a,{target:"e1p5zhim2",label:"StyledLink"})({name:"qar1bk",styles:"padding:15px 0;"}),x=Object(r.a)("span",{target:"e1p5zhim3",label:"PublishDate"})({name:"s9xu3a",styles:"color:rgba(12,17,43,0.9);font-size:0.9em;"}),O=Object(r.a)("div",{target:"e1p5zhim4",label:"Excerpt"})({name:"11j6eo1",styles:"line-height:1.6em;color:rgba(12,17,43,0.8);"});var m=Object(l.connect)(e=>{var{state:t,actions:a,libraries:r}=e,{totalPages:l}=t.source.get(t.router.link),{path:i,page:o,query:b}=r.source.parse(t.router.link),j=o<l,u=o>1,x=r.source.stringify({path:i,page:o+1,query:b}),O=r.source.stringify({path:i,page:o-1,query:b});return Object(n.useEffect)(()=>{j&&a.source.fetch(x)},[]),Object(c.jsx)("div",null,j&&Object(c.jsx)(s.a,{link:x},Object(c.jsx)(p,null,"← Older posts")),u&&j&&" - ",u&&Object(c.jsx)(s.a,{link:O},Object(c.jsx)(p,null,"Newer posts →")))}),p=Object(r.a)("em",{target:"esft81u0",label:"Text"})({name:"xhf1f8",styles:"display:inline-block;margin-top:16px;"});t.default=Object(l.connect)(e=>{var{state:t}=e,a=t.source.get(t.router.link);return Object(c.jsx)(d,null,a.isTaxonomy&&Object(c.jsx)(g,null,a.taxonomy,": ",Object(c.jsx)("b",null,t.source[a.taxonomy][a.id].name)),a.isAuthor&&Object(c.jsx)(g,null,"Author: ",Object(c.jsx)("b",null,t.source.author[a.id].name)),a.items.map(e=>{var{type:a,id:r}=e,n=t.source[a][r];return Object(c.jsx)(o,{key:n.id,item:n})}),Object(c.jsx)(m,null))});var d=Object(r.a)("section",{target:"exiu6z10",label:"Container"})({name:"447sei",styles:"width:800px;margin:0;padding:24px;list-style:none;"}),g=Object(r.a)("h3",{target:"exiu6z11",label:"Header"})({name:"p2cv",styles:"font-weight:300;text-transform:capitalize;color:rgba(12,17,43,0.9);"})}}]);